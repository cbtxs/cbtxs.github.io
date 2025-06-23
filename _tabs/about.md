---
title: 个人简介
icon: fas fa-info-circle
order: 4
katex: true
---

<link rel="stylesheet" href="/assets/katex/katex.min.css">
<script defer src="/assets/katex/katex.min.js">
</script>
<script defer src="/assets/katex/auto-render.js" onload="renderMathInElement(document.body);">
</script>

<div style="display: flex; gap: 20px; align-items: center;">
  <!-- 左侧文字信息 -->
  <div style="flex: 1;">
    <ul style="list-style-type: none; padding-left: 0;">
      <li><strong>姓名</strong>：陈春雨 </li>
      <li><strong>邮箱</strong>：cbtxs@smail.xtu.edu.cn</li>
      <li><strong>GitHub</strong>: <a href="https://github.com/cbtxs">@cbtxs</a></li>
    </ul>
        湘潭大学数学与计算科学学院2021级博士研究生，研究方向为有限元方法与虚单元方法。
  </div>
  <!-- 右侧照片 -->
  <div style="flex: 1; text-align: center;">
    <img src="/image/pic.jpg" alt="头像" style="max-width: 80%; border-radius: 8px;" />
  </div>
</div>

## 教育经历
- 2025.01 - 2025.05 美国加州大学尔湾分校（UCI）数学系，访问学者。
- 2021.09 - 2025.06 湘潭大学 数学与计算科学学院，博士。
- 2019.09 - 2021.06 湘潭大学 数学与计算科学学院，硕士。
- 2015.09 - 2019.06 河南师范大学 数学与信息科学学院，学士。

## 工作经历
- 2025.07 至今 北京大学 数学科学学院，博士后。

## 科研技能
- 熟练掌握 Python、C++等编程语言。
- 熟悉有限元方法、虚单元方法等数值计算方法。

## 研究兴趣
- 张量有限元、分布有限元等新型有限元方法
- 虚单元方法理论及其应用
- 引力波问题的数值模拟
- 工业仿真软件开发

## 获奖情况
- 2025年 中国科协青年人才托举工程博士计划
- 2025年 湘潭大学校长奖学金
- 2025年 湘潭大学优秀毕业生
- 2024年 国家奖学金
- 2024年 湖南计算数学应用软件学会一等奖
- 2023年 国家奖学金

## 发表论文

## 开源贡献
作为核心开发者参与开发开源 CAX 共性基础算法库 [FEALPy](https://github.com/weihuayi/fealpy)，
主要负责有限元模块开发，实现了包括：
- BDM 元、RT 元、Nédélec 元
- Hu-Zhang 元
- $C^m$ 光滑元
- $H^1$ 协调与非协调虚单元方法


<script>
// 确保KaTeX只渲染特定元素（可选）
document.addEventListener("DOMContentLoaded", function() {
    renderMathInElement(document.body, {
        delimiters: [
            {left: '$$', right: '$$', display: true},
            {left: '$', right: '$', display: false},
            {left: '\\(', right: '\\)', display: false},
            {left: '\\[', right: '\\]', display: true}
        ],
        throwOnError: false
    });
});
</script>
