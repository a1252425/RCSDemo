//
//  RCSTextViewController.m
//  RCSDemo
//
//  Created by shaoshuai on 2023/7/27.
//

#define kContent @"MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述：MVVM 模式的特征是 ViewModel 层和 View 层采用双向绑定的形式（Binding），View 层的变动，将自动反映在 ViewModel 层，反之亦然。但是双向绑定给调试和错误定位带来困难，View 层的异常可能是 View 的代码有问题，也有可能是 Model 层的问题。数据绑定使得一个位置的 Bug 被传递到别的位置，要定位原始出问题的地方就变得不那么容易了。对简单UI 来说，实现 MVVM 模式的开销是不必要的，而对于大型应用来说，引入 MVVM 模式则会节约大量手动更新视图的复杂过程，是否使用，还是看使用场景。Vue 的双向绑定机制应该算是比较有 MVVM 模式的影子，但 Vue 文档 里面是这么描述："

#import "RCSTextViewController.h"

@interface RCSTextViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *items;

@end

@implementation RCSTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"滚动"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onRightClicked)];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)onRightClicked {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.items.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.items[indexPath.item];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

#pragma mark - Content -

- (NSArray *)items {
    if (!_items) {
        _items = @[kContent, kContent, kContent, kContent, kContent, kContent, kContent, kContent, kContent, kContent];
    }
    return _items;
}

@end
