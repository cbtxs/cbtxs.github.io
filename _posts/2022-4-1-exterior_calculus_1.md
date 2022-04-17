---
title: 有限元外微分(一)：外代数与外微分
author: cbtxs
date: 2022-04-01 20:42:14 +0800
katex: true
comments : true
categories: [偏微分方程数值解]
tags: [tutorial]
---

## **写在前面**
有限元外微分使用微分几何, 代数拓扑和同调代数等工具, 
是一种用于理解和设计有限元离散方式的理论. 

## **简介**
有限元方法是构建一个解的子空间, 找子空间上最适合方程的解.
有限元方法可以方便的讨论数值解与真解之间的误差, 其中误差包含三部分:
- 逼近误差: 度量数值解与真解之间的误差.
- 连续性误差: 有些问题需要解具有一定的连续性, 需要度量连续性.
- 稳定性误差: 度量设计的方法是否合适.

其中逼近误差和连续性误差容易解决, 但是稳定性误差却不好消除.
**连续问题的可逼近性、一致性和适定性并不意味着稳定性**

PDE 问题的适定性反映了这个问题的几何, 代数, 拓扑, 同调结构, 由外微分, 同调代数,
Hodge 理论形式化.

## **外代数**
### **交替代数**
令 $$V$$ 是一个 $$n$$ 维实向量空间, 用 $$\mathrm{Alt}^{k} V$$
表示所有 $$V\times V\cdots\times V \to \R$$ 上的线性映射, 将其中的元素称为 
$$V$$ 上的代数 $$k$$ 形式. 特别的有: 
$$\mathrm{Alt}^0 V = \R, \mathrm{Alt}^1 V = V^*$$.

### **外积**
给定 $$\omega \in \mathrm{Alt}^i V, \eta \in \mathrm{Alt}^j K$$, 定义其外积为:
$$\omega\wedge \eta \in \mathrm{Alt}^{i+j}V$$:

$$
\omega\wedge\eta(v_1, v_2, \cdots, v_{i+j}) = 
\sum_{\sigma}\mathrm{sign}(\sigma) \omega(v_{\sigma(1)}, \cdots, v_{\sigma(i)})
\eta(v_{\sigma(i+1)}, \cdots, v_{\sigma(i+j)}))
$$

其中 $$\sigma$$ 取遍所有 $$(1, 2, ..., i+j)$$ 的全排列, 且满足 $$\sigma(1) <
\cdots< \sigma(i), \sigma(i+1) < \cdots< \sigma(i+j)$$. 

外积是双线性的, 且满足 **反交换条件**:

$$
\omega \wedge \eta = (-1)^{ij}\eta \wedge \omega
$$

记 $$\mathrm{Alt} V = \oplus_{k} \mathrm{Alt}^k V$$, 其在外积下组成一个代数称为
**Grassmann 代数** 或 **$$V^*$$ 的外代数**.

### **拉回映射**
若 $$L : V \to W$$ 是一个线性映射, 则由 $$L$$ 可以诱导一个映射 
$$L^* : \mathrm{Alt} W \to \mathrm{Alt} V$$:

$$
L^*\omega(v_1, v_2, \cdots, v_k) = \omega (Lv_1, Lv_2, \cdots, Lv_k) \quad  
\forall \omega \in \mathrm{Alt}^k W, \ v_1, v_2, \cdots, v_k \in V
$$

$$L^*$$ 称为 $$L$$ 的**拉回映射**, 意为将 $$W$$ 上的 $$k$$ 形式拉回 $$V$$ 上.

拉回映射有**传导性**: 若 $$U \xrightarrow{K} V \xrightarrow{L} W$$, 则 
$$\mathrm{Alt} W \xrightarrow{L^*} \mathrm{Alt} V \xrightarrow{K^*} \mathrm{Alt} W$$. 
且有: **拉回的复合等于复合的拉回, 外积的拉回等于拉回的外积:**

$$
K^* \circ L^* = (L\circ K)^*, \quad 
L^*(\omega\wedge\eta) = L^* \omega \wedge L^* \eta
$$

特殊地, 当 $$V \subset W$$, $$W$$ 上定义了度量, 
则存在一个恒同映射 $$i : V \to W$$, 正交投影映射 
$$\pi : W \to V$$, 即 $$W \xrightarrow{\pi} V \xrightarrow{i} W$$, 
则有 $$\mathrm{Alt} W \xrightarrow{i^*} \mathrm{Alt} V 
\xrightarrow{\pi^*} \mathrm{Alt} U$$. 
$$k$$ 形式 $$\omega \in \mathrm{Alt}W$$ 对于空间 $$V$$ 的切向分量为 

$$
(\pi^*i^* \omega)(v_1, v_2, \cdots, v_k) = \omega(\pi v_1, \pi v_2, \cdots, \pi
v_k)
$$

法向分量为 $$\omega - \pi^*i^* \omega$$.

### **基**
若 $$v_0, v_1, \cdots, v_{n-1}$$ 是 $$V$$ 的一组基, 定义递增序列集合 

$$
A_n^k = \{\sigma :  \{0, 1, \cdots, k-1\} \to \{0, 1, \cdots, n-1\}, 
\ \sigma(i) \leq \sigma(i+1)\}
$$ 

则代数 $$k$$ 形式 $$\omega$$ 可被
$$\{\omega(v_{\sigma(0)}, v_{\sigma(1)}, \cdots, v_{\sigma(k-1)}), 
\sigma \in A_{n}^k\}$$
唯一确定.

根据 $$V$$ 的基可以定义 $$V^*$$ 的基 $$\{\mu_i\}_{i=0}^{k-1}$$, 满足:

$$
\mu_i(v_j) = \delta_{ij}
$$






















