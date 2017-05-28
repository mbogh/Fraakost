<?php
class Canteen {
  public $id;
  public $name;
  public $menu = [];
  private $location_id;

  function __construct($id, $data) {
    $this->id = $id;
    $this->name = $data->name;
    $this->menu = $data->menu;
    $this->location_id = $data->location;
  }
}
?>
