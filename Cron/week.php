<?php
class Week {
  private $week_number;
  private $canteen;
  private $data;
  private $lunches = [];

  function __construct($week_number, $canteen, $data) {
    $this->week_number = $week_number;
    $this->canteen = $canteen;
    $this->data = $data;
  }
}
?>
