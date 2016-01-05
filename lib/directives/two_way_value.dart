import 'package:angular2/angular2.dart';

@Directive(selector: '[value]')
class TwoWayValueDirective {
  @Output() EventEmitter valueChange = new EventEmitter();

  @HostListener('input', const ['\$event'])
  void onInput(e) {
    valueChange.add(e.currentTarget.value);
  }
}