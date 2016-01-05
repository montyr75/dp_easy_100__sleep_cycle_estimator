import 'package:angular2/angular2.dart';

@Directive(
    selector: 'paper-input[model]',
    host: const {
      '[value]': 'model',
      '(input)': 'modelChange.add(\$event.currentTarget.value)'
    }
)
class ModelDirective {
  @Input() dynamic model;
  @Output() EventEmitter modelChange = new EventEmitter();
}