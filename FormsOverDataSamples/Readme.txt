Bootstrap Forms Over Data Samples
--------------------------------------------------
Dependencies
  Bootstrap (http://www.getbootstrap.com)
  JQuery UI (http://www.jqueryui.com)
    We need this to work with Modernizr to create a date picker for IE
  Modernizr (http://www.modernizr.com)
    Used to detect what HTML 5 features are supported

NOTE:
  ClientIDMode="Static" and EnableViewState="false" are set in Web.Config


GridView Samples
--------------------------------------------------------
GridViewSample01.aspx - Normal GridView with no responsive CSS. Notice the Pager is not good for smaller devices
GridViewSample02.aspx - Use 'table-responsive' and they work better on smaller device. Notice the styling on the pager.

GridViewSample03.aspx - GridView and DetailView

GridViewSample04.aspx - Normal Input Form
  IntroductionDate must be formatted as "yyyy-MM-dd"
  Using appearing and disappearing edit/grid areas
GridViewSample05.aspx - Using a Modal input screen. Note conversion of JavaScript date. Disabled view state. Use of 'step=any' to accept decimal values
GridViewSample06.aspx - Alternate Layout using GridView


Repeater Samples
--------------------------------------------------------
RepeaterSample01.aspx - Can't just use <div class="col-*"> as these won't work on small devices since you lose the header

RepeaterSample02.aspx - This is more like the alternative GridView shown in GridViewSample06.aspx
  ViewState is enabled in this page in order for it to work

RepeaterSample03.aspx - Using a Carousel
  ViewState is enabled in this page in order for it to work


Misc Samples
--------------------------------------------------------
DualPurpose.aspx - Shows converting from mobile to full screen
