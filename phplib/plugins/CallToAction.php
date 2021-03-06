<?php

/**
 * Call to action for occasional activism. Shown as a top banner colored in
 * red (Bootstrap danger color).
 **/

class CallToAction extends Plugin {

  /* template name, relative to templates/plugins/callToAction/ */
  private $templateName;

  /* true if the user hid the banner (cookie-based) */
  private $visible;

  public function __construct() {
    $this->templateName = Config::get('plugins.callToActionTemplate');
    $this->hidden = isset($_COOKIE['hideCallToAction']);
  }

  function bodyStart() {
    if (!$this->hidden) {
      print SmartyWrap::fetch('plugins/callToAction/' . $this->templateName);
    }
  }

  function cssJsSmarty() {
    if (!$this->hidden) {
      SmartyWrap::addPluginCss('callToAction/callToAction.css');
      SmartyWrap::addPluginJs('callToAction/callToAction.js');
      SmartyWrap::addJs('cookie');
    }
  }
}
