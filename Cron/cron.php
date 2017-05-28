<?php
// morten+cron@justabeech.com - 3jKnxQrgC7chUAygBn
  require('week.php');
  require('meal.php');
  require('lunch.php');
  require('canteen.php');

  error_reporting(E_ERROR | E_PARSE);
  $token = 'wmyYGU3L5vq1d6EHy56d2RBBnUEoAlGtyr3O6TSX';

  $canteens_url = "https://brick-lunch.firebaseio.com/canteens.json";
  $canteens_data = file_get_contents($canteens_url);
  $canteens_json = json_decode($canteens_data);
  $canteens = [];
  foreach ($canteens_json as $id => $canteen) {
    $canteens[] = new Canteen($id, $canteen);
  }

  foreach ($canteens as $canteen) {
    foreach ($canteen->menu as $language => $menu_url) {
      $page = file_get_contents($menu_url);
      $doc = new DOMDocument();
      // $doc->validateOnParse = true;
      $doc->loadHTML($page);
      $xpath = new DOMXpath($doc);

      $current_week = new Week(date('W'), $canteen->id, $xpath);

      $week_days = [0, 1, 2, 3, 4, 5, 6];
      $week_number = 'w' . date('W') . '-';
      $week_ids = [];
      foreach ($week_days as $value) {
        $week_ids[$value] = $week_number . $value;
      }


      $monday = date("Y-m-d", strtotime('last monday', strtotime('next week', time())));
      $lunches = [];
      foreach ($week_ids as $key => $week_id) {
        $lunch = new Lunch(date("Y-m-d", strtotime($monday . " +$key day")), $canteen->id, $language);
        $query = '//div[@id="'. $week_id .'"]/div/div/div[1]';
        $elements = $xpath->query($query);

        $meals = [];
        if (!is_null($elements)) {
          $title = NULL;
          foreach ($elements as $element) {
            if (is_null($title)) {
              $title = $element->textContent;
            } else {
              $meals[] = new Meal($title, trim($element->textContent));
              $title = NULL;
            }
          }
        }

        $lunch->meals = $meals;
        $lunches[] = $lunch;
      }

      foreach ($lunches as $key => $lunch) {
        $data = json_encode($lunch->getJSON());
        $url = "https://brick-lunch.firebaseio.com/lunches/". $lunch->id .".json?auth=$token";

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PATCH");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_HEADER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($data)
        ));

        $output = curl_exec($ch);
        // echo($output) . PHP_EOL;
        curl_close($ch);
      }
    }
  }
  exit;

  // $url = "http://dk20.eurest.dk/midtown/ugemenu";
  // $canteen_id = "4DFB931D-0313-4A89-ADB1-2DC145E73052";

  // echo json_encode($lunches, JSON_PRETTY_PRINT);
?>
