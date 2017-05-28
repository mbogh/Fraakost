<?php
class Meal {
  public $type;
  public $text;

  function __construct($title, $text) {
    $this->type = $this->getTypeFromTitle($title);
    $this->text = $text;
  }

  function getTypeFromTitle($title) {
    switch ($title) {
      case 'Varm ret':
      case 'Warm dish':
        return 'hot';
        break;
      case 'Vegetar':
      case 'Vegetarian':
        return 'vegetarian';
        break;
      case 'Salat':
      case 'Salad':
        return 'salad';
        break;
    }
  }

  function getJSON() {
    $meal = $this->text;
    return $meal;
  }
}
?>
