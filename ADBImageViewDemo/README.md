# ADBImageView

ADBImageView inherits from UIImageView and allow asynchronous image loading from the cloud using NSURLConnectionDelegate protocol built-in Cocoa. 
It shows up a placeholder image and an activity indicator during the loading. It provides gesture for single tap and long press.
It also provides caching functionalities taken from Toto Tvalavadze's [TCImageView](https://github.com/totocaster/TCImageView).

Try out the included demo project.

Simple usage:

- copy ADBImageView class into your project
- import `ADBImageView.h` in your class
- use as follow

``` objective-c
ADBImageView *imageView = [[ADBImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 128.0, 128.0)];
imageView.delegate = self;
    
[imageView setImageWithURL:[NSURL URLWithString:@"http://www.albertodebortoli.it/GitHub/ADBImageView/H-Farm.jpg"]
          placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
```

- to load another image on the same object use

``` objective-c
[imageView reloadWithUrl:[NSURL URLWithString:@"http://www.albertodebortoli.it/GitHub/ADBImageView/H-umus.jpg"]];
```

- use delegation pattern implementing ADBImageViewDelegate protocol and related optional delegate methods

``` objective-c
#pragma mark - ADBImageViewDelegate
- (void)ADBImageView:(ADBImageView *)view willUpdateImage:(UIImage *)image { ... }
- (void)ADBImageView:(ADBImageView *)view didLoadImage:(UIImage *)image { ... }
- (void)ADBImageView:(ADBImageView *)view failedLoadingWithError:(NSError *)error { ... }
- (void)ADBImageViewDidSingleTap:(ADBImageView *)view { ... }
- (void)ADBImageViewDidLongPress:(ADBImageView *)view { ... }
```

# License

Licensed under the New BSD License.

Copyright (c) 2012, Alberto De Bortoli
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Alberto De Bortoli nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## Resources

Info can be found on [my website](http://www.albertodebortoli.it), [and on Twitter](http://twitter.com/albertodebo).
