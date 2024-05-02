<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
</head>
<body>
    <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seat Reservation</title>
<style>
    body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            height: 100%;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
        }

        .nav-links {
            display: flex;
            gap: 15px;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .navigation-item a, .auth-links a {
            padding: 5px;
            font-size: 14px;
            font-weight: bold;
            color: #737373;
            text-decoration: none;
        }

        .auth-links a {
            color: #23a6f0;
        }

        .auth-container {
            margin-left: auto;
            display: flex;
            gap: 10px;
        }

        .seat {
            display: inline-block;
            width: 40px;
            height: 40px;
            border: 1px solid black;
            margin: 5px;
            text-align: center;
            line-height: 30px;
        }

        .seats-container {
            width: 800px;
            height: 500px;
            flex-direction: row;
            margin: 100px auto 1% auto;
            display: flex;
        }

        .seats1, .seats4 {
            width: 21%;
            height: 100%;
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            left: 40%; /* ì¡°ì í  ê±°ë¦¬ */
        }

        .seats2, .seats3 {
            width: 28%;
            height: 100%;
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            left: 40%; /* ì¡°ì í  ê±°ë¦¬ */
        }
        .nextbox {
    width: 232px;
    height: 70px;
    background: #d9d9d9;
    position: fixed;
    bottom: 20px; /* ìíë ê±°ë¦¬ */
    right: 20px; /* ìíë ê±°ë¦¬ */
    display: flex;
    align-items: center;
    justify-content: center;
}

.next-wrapper {
    display: flex;
    align-items: center;
}

.next-icon {
    margin-right: 5px;
}

.next-text {
    font-size: 32px;
    font-weight: 500;
    color: #000;
}
</style>
</head>
<body>

    <div class="header-container">
        <div class="nav-links">
            <div class="navigation-item"><a href="#home">Home</a></div>
            <div class="navigation-item"><a href="#booking">ìë§¤</a></div>
            <div class="navigation-item"><a href="#movies">ìí</a></div>
            <div class="navigation-item"><a href="#mypage">MyPage</a></div>
            <div class="navigation-item"><a href="#support">ê³ ê°ì¼í°</a></div>
        </div>
        <div class="auth-container">
            <div class="auth-links">
                <a href="#login">Login</a> / <a href="#register">Register</a>
            </div>
        </div>
    </div>

    <h2>ì¢ì ë°°ì¹ë</h2>

    <div class="screenBoxAll">
      <div class="screenBox" style="width: 1050px; height: 116px; background: #d9d9d9; position: relative;">
        <p style="font-size: 40px; text-align: center; color: #000; position: absolute; top: -15; transform: translateY(-50%); left: 50%; transform: translateX(-50%);">ì¤í¬ë¦°</p>
      </div>
    </div>

    <div class="seats-container">
    <div class="seats1">
        <div class="seat" style="color: white; border: #d9d9d9;">1</div>
        <div class="seat">2</div>
        <div class="seat">3</div>
        <div class="seat">15</div>
        <div class="seat">16</div>
        <div class="seat">17</div>
        <div class="seat">29</div>
        <div class="seat">30</div>
        <div class="seat">31</div>
        <div class="seat">43</div>
        <div class="seat">44</div>
        <div class="seat">45</div>
        <div class="seat">57</div>
        <div class="seat">58</div>
        <div class="seat">59</div>
        <div class="seat">71</div>
        <div class="seat">72</div>
        <div class="seat">73</div>
        <div class="seat">85</div>
        <div class="seat">86</div>
        <div class="seat">87</div>
        <div class="seat">99</div>
        <div class="seat">100</div>
        <div class="seat">101</div>
        <div class="seat">113</div>
        <div class="seat">114</div>
        <div class="seat">115</div>
        <div class="seat">127</div>
        <div class="seat">128</div>
        <div class="seat" style="color: white; border: #d9d9d9;">129</div>
        
    </div>
    
    
    <div class="seats2">
        <div class="seat" style="color: white; border: #d9d9d9;">4</div>
        <div class="seat">5</div>
        <div class="seat">6</div>
        <div class="seat">7</div>
        <div class="seat">18</div>
        <div class="seat">19</div>
        <div class="seat">20</div>
        <div class="seat">21</div>
        <div class="seat">32</div>
        <div class="seat">33</div>
        <div class="seat">34</div>
        <div class="seat">35</div>
        <div class="seat">46</div>
        <div class="seat">47</div>
        <div class="seat">48</div>
        <div class="seat">49</div>
        <div class="seat">60</div>
        <div class="seat">61</div>
        <div class="seat">62</div>
        <div class="seat">63</div>
        <div class="seat" style="color: white; border: #d9d9d9;">74</div>
        <div class="seat" style="color: white; border: #d9d9d9;">75</div>
        <div class="seat" style="color: white; border: #d9d9d9;">76</div>
        <div class="seat" style="color: white; border: #d9d9d9;">77</div>
        <div class="seat">88</div>
        <div class="seat">89</div>
        <div class="seat">90</div>
        <div class="seat">91</div>
        <div class="seat">102</div>
        <div class="seat">103</div>
        <div class="seat">104</div>
        <div class="seat">105</div>
        <div class="seat">116</div>
        <div class="seat">117</div>
        <div class="seat">118</div>
        <div class="seat">119</div>
        <div class="seat" style="color: white; border: #d9d9d9;">130</div>
        <div class="seat">131</div>
        <div class="seat">132</div>
        <div class="seat">133</div>
        
    </div>

    <div class="seats3">
        <div class="seat">8</div>
        <div class="seat">9</div>
        <div class="seat">10</div>
        <div class="seat" style="color: white; border: #d9d9d9;">11</div>
        <div class="seat">22</div>
        <div class="seat">23</div>
        <div class="seat">24</div>
        <div class="seat">25</div>
        <div class="seat">36</div>
        <div class="seat">37</div>
        <div class="seat">38</div>
        <div class="seat">39</div>
        <div class="seat">50</div>
        <div class="seat">51</div>
        <div class="seat">52</div>
        <div class="seat">53</div>
        <div class="seat">64</div>
        <div class="seat">65</div>
        <div class="seat">66</div>
        <div class="seat">67</div>
        <div class="seat" style="color: white; border: #d9d9d9;">78</div>
        <div class="seat" style="color: white; border: #d9d9d9;">79</div>
        <div class="seat" style="color: white; border: #d9d9d9;">80</div>
        <div class="seat"  style="color: white; border: #d9d9d9;">81</div>
        <div class="seat">92</div>
        <div class="seat">93</div>
        <div class="seat">94</div>
        <div class="seat">95</div>
        <div class="seat">106</div>
        <div class="seat">107</div>
        <div class="seat">108</div>
        <div class="seat">109</div>
        <div class="seat">120</div>
        <div class="seat">121</div>
        <div class="seat">122</div>
        <div class="seat">123</div>
        <div class="seat">134</div>
        <div class="seat">135</div>
        <div class="seat">136</div>
        <div class="seat" style="color: white; border: #d9d9d9;">137</div>
        
    </div>


    <div class="seats4">
        <div class="seat">12</div>
        <div class="seat">13</div>
        <div class="seat" style="color: white; border: #d9d9d9;">14</div>
        <div class="seat">26</div>
        <div class="seat">27</div>
        <div class="seat">28</div>
        <div class="seat">40</div>
        <div class="seat">41</div>
        <div class="seat">42</div>
        <div class="seat">54</div>
        <div class="seat">55</div>
        <div class="seat">56</div>
        <div class="seat">68</div>
        <div class="seat">69</div>
        <div class="seat">70</div>
        <div class="seat">82</div>
        <div class="seat">83</div>
        <div class="seat">84</div>
        <div class="seat">96</div>
        <div class="seat">97</div>
        <div class="seat">98</div>
        <div class="seat">110</div>
        <div class="seat">111</div>
        <div class="seat">112</div>
        <div class="seat">124</div>
        <div class="seat">125</div>
        <div class="seat">126</div>
        <div class="seat" style="color: white; border: #d9d9d9;">138</div>
        <div class="seat">139</div>
        <div class="seat">140</div>

    </div>
    
</div>

</div>
<div class="nextbox">
  <div class="next-wrapper">
    <svg class="next-icon" width="14" height="14" viewBox="0 0 14 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M0 20.5714L8.57143 12L0 3.42857L1.71429 0L13.7143 12L1.71429 24L0 20.5714Z" fill="#23A6F0"></path>
        </svg>
        <p class="next-text">NEXT</p>
      </div>
    </div>
        
</body>
</html>

</body>
</html>