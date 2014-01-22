## Android API 19 Webview Automation

#### JavaScript evaluation

```ruby
# automate flickr login https://mlogin.yahoo.com/w/login?
# first click into the webview, then attach.

webview = Appium::Android::Webview.attach_to_tab package: 'com.example.Package', url: 'yahoo.com/'
webview.client.page_events = true

# javascript from this commit:
# https://github.com/appium/ruby_lib/commit/9b838f4dc280126e4468a177fa4dd83eb2417512
js = Appium::Android::Webview.javascript + <<-JS
firstEmailInput().value = 'example@example.com';
firstPasswordInput().value =  'password'
firstSubmitElement().click();
JS

webview.client.remote_eval js
webview.client.wait_for(type: WebkitRemote::Event::PageLoaded).last

# must sleep to let the page load. the page loaded event doesn't mean the page has loaded...
sleep 5

# wait for element to exist on page, then check readystate
wait_true { webview.client.remote_eval('firstAuthElement() !== null;') }
wait_true { webview.client.remote_eval('document.readyState') == 'complete' }

js = Appium::Android::Webview.javascript + <<-JS
firstAuthElement().click();
JS

webview.client.remote_eval js

# now we're successfully logge in and authorized on flickr
```

#### uiautomator accessibility

1. Load a webview. Exit the webview. From now on all webviews will have accessibility enabled.

```ruby
textfield(1).type 'example@example.com'
textfield(2).type 'password'
name('sign in').click

name("ok, i'll authorize it").click 
```
