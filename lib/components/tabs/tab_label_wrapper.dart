import 'package:angular2/core.dart';

/**
 * Used in the `md-tab-group` view to display tab labels
 * @internal
 */
@Directive(selector: "[md-tab-label-wrapper]")
class MdTabLabelWrapper {
  ElementRef elementRef;

  MdTabLabelWrapper(this.elementRef);

  /**
   * Sets focus on the wrapper element
   */
  void focus() {
    elementRef.nativeElement.focus();
  }
}
