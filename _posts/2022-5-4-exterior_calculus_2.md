---
title: 有限元外微分(二)：流形上的外微分
author: cbtxs
date: 2022-05-04 22:31:14 +0800
katex: true
comments : true
categories: [偏微分方程数值解]
tags: [微分几何, 偏微分方程数值解, 有限元]
---

## **写在前面**
在[有限元外微分(一)](https://cbtxs.github.io/posts/exterior_calculus_1/)
中讲了基本的外代数的知识, 主要是在线性空间上的操作, 
本文讲的是在一个微分流形上, 每个点上都有一个切空间,
这个切空间上就可以定义外代数, 由此可以定义这个流形上的外微分.

## **流形**
一个 $$n$$ 维的光滑流形可以认为就是局部是 $$\mathbb R^n$$ 的拓扑空间,
流形上每一点有一个切空间, 流形 $$\Omega$$ 上一点 $$x$$ 处的切空间记为
$$T_x\Omega$$, 用一个元组 $$(x, v)$$ 表示 $$\Omega$$ 上的一个**切丛**, 其中 
$$x \in \Omega, v \in T_x\Omega$$, $$\Omega$$ 上所有的切丛组成一个新的流形, 
维数为 $$2n$$, 事实上, **切丛就是向量场**.

对于两个流形 $$\Omega, \Omega'$$, 若 $$\phi : \Omega \to \Omega'$$
是一个光滑映射, 那么定义切映射 $$D\phi_x$$ 是 $$T_x\Omega$$ 到
$$T_{\phi(x)}\Omega'$$ 的映射.
- 当 $$\Omega' = \R$$, $$\phi$$ 就是 $$\Omega$$ 上的标量函数, 用 
  $$\partial_v \phi(x)$$ 表示 $$D\phi_x(v)$$.
- 当 $$\Omega = \R$$, $$\phi$$ 是 $$\Omega$$ 上的一条曲线. 用 
  $$\frac{d\phi(t)}{dt}$$ 表示 $$D\phi_t(1)$$.

## **微分形式**
类似于切丛的概念, 可以定义**外形式丛**: $$(x, \mu)$$, 其中 $$x\in \Omega, \mu
\in \mathrm{Alt}^k T_x\Omega$$. 一个微分 $$k$$ 形式就是一种外形式丛, 即:
$$\omega = (x, \omega_x)$$ 是一个微分 $$k$$ 形式, 当对于任意的光滑矢量场 
$$\{v_i\}_{i=0}^{k-1}$$, 映射

$$
x \to \omega_x(v_0(x), \cdots, v_{k-1}(x))
$$

是无穷光滑的.

即光滑的外形式丛就是微分 $$k$$ 形式, 简记为 $$k$$ 形式, 这里用
$$\Lambda^k(\Omega)$$ 表示 $$\Omega$$ 上所有的微分 $$k$$ 形式组成的空间, 特别的,
$$ \Lambda^0(\Omega) = C^{\infty}(\Omega)$$, $$\Lambda^1(\Omega)$$
是所有的光滑余切向量场.

## **外积**
令 $$\Lambda(\Omega) = \oplus_k\Lambda^k(\Omega)$$, 逐点定义外积

$$
(\omega \wedge \eta)_x = \omega_x \wedge \eta_x
$$

## $$C^m$$ **光滑的微分形式**
现在考虑没有那么光滑的微分形式, 对于一个外形式丛 $$\omega = (x, \omega_x)$$, 
若映射 

$$
x \to \omega_x(v_0(x), \cdots, v_{k-1}(x))
$$

对于任意光滑向量场 $$\{v_i\}_{i=0}^{k-1}$$ 属于 $$C^m(\Omega)$$ 
即是 $$m$$ 次光滑的, 则称 $$\omega$$ 是一个 $$C^m$$ 微分 $$k$$ 形式,
其组成的空间记为 $$C^m\Lambda^k(\Omega)$$.














