Automatically convert yard's HTML output to Markdown. Run in Chrome Dev Tools console.

```javascript
// http://localhost:8808/docs/toplevel

var methods = $x('//*[@id="content"]/ul/li');

var sig = function(method) { return method.children[0].children[0].textContent.trim().substr(2); };
var desc = function(method) { return method.children[1].children[0].textContent.trim(); };

// All element methods must include the element name.
// Check textfield before text because text is included in textfield.
var elements = [ 'alert', 'button', 'textfield', 'text', 'window' ];
var output = {};

for (var b = 0; b < elements.length; b++) {
  output[elements[b]] = [];
}

for (var a = 0; a < methods.length; a++) {
  var name = sig(methods[a]);
  var text = desc(methods[a]);
  var index = '';

  for (var b = 0; b < elements.length; b++) {
    if (name.indexOf(elements[b]) !== -1 && name.indexOf('find_ele') === -1) {
      index = elements[b];
      break;
    }
  }

  if (index === '') { continue; }
  output[index].push( [name, text] );
}

for (var b = 0; b < elements.length; b++) {
  var eles = output[elements[b]];
  console.log("\n" + '#### ' + elements[b]);
  for (var c = 0; c < eles.length; c++) {
    var ele = eles[c];
    console.log('0. `' + ele[0] + '` ' + ele[1]);
  }
}
```
