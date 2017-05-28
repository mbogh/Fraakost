<?php

class Lunch {
  public $id = NULL;
  public $date;
  public $canteen;
  public $meals = [];
  public $language;

  function __construct($date, $canteen, $language) {
    $this->date = $date;
    $this->canteen = $canteen;
    $this->id = $canteen . '-' . $date;
    $this->language = $language;
  }

  function getJSON() {
    $meals = [];
    foreach ($this->meals as $meal) {
      $meals[$meal->type] = $meal->getJSON();
    }

    $lunch = [
      'date' => $this->date,
      'canteen' => $this->canteen,
      $this->language => ['meals' => $meals]
    ];
    return $lunch;
  }
}

?>
