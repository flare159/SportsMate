<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html lang="en">


<%
    String userid = (String) session.getAttribute("userid");
    String username = (String) session.getAttribute("username");

%>


<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 60px 50px 50px 50px;
            background-color: #121212;
            color: white;
        }

        form {
            background: #1e1e1e;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 600px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        td {
            padding: 10px;
            text-align: center;
        }

        input[type="text"], input[type="date"], textarea, select {
            border: 1.5px solid #333;
            background-color: #2e2e2e;
            color: white;
            width: 100%;
            border-radius: 5px;
            padding: 10px;
            font-size: 15px;
            box-sizing: border-box;
        }

        .header {
            display: block;
            text-align: left;
            margin-bottom: 3px;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 10px;
        }

        textarea {
            resize: vertical;
            height: 300px;
        }

        input[type="file"] {
            border: 1.5px solid #333;
            background-color: #2e2e2e;
            color: white;
            width: 100%;
            border-radius: 5px;
            padding: 10px;
            box-sizing: border-box;
            cursor: pointer;
            font-size: 15px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }

        h2 {
            margin: 15px;
            font-size: 24px;
            color: white;
        }

        .file-upload {
            text-align: left;
            margin-top: 20px;
        }

    </style>
</head>

<body>

<form name="writeFrm" method="post" action="../mvcboard/ProjectWrite.do" onsubmit="return validateForm(this);" enctype="multipart/form-data">

    <table>
        <tr>
            <td colspan="2"><h2>글쓰기</h2></td>
        </tr>
        <tr>
            <td class="header">제목</td>
        </tr>
        <tr>
            <td><input type="text" placeholder="제목을 입력하세요" name="title" style="padding: 20px"></td>
        </tr>
        <tr>
            <td><label>약속 날짜</label>
                <input type="date" id="dates" name="dates">
            </td>
        </tr>
        <tr>
            <td>
                <label for="sport">스포츠</label>
                <select name="sport" id="sport">
                    <option value="배드민턴">배드민턴</option>
                    <option value="탁구">탁구</option>
                    <option value="클라이밍">클라이밍</option>
                    <option value="테니스">테니스</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="header">모집 인원 수</td>
        </tr>
        <tr>
            <td><input type="text" placeholder="모집 인원 수를 입력하세요" name="people" min="0"></td>
        </tr>
        <tr>
            <td class="header">세부내용</td>
        </tr>
        <tr>
            <td><textarea placeholder="세부 내용을 입력하세요" name="detail"></textarea></td>
        </tr>

        <tr>
            <td class="header">사진 첨부</td>
        </tr>
        <tr>
            <td class="file-upload">
                <input type="file" name="ofile" style="padding: 15px">
            </td>
        </tr>

        <tr>
            <td>
                <input type="submit" value="등록"
                        style="border-radius: 15px; padding: 15px; margin-top: 20px; background-color: #007bff;">
            </td>
        </tr>
    </table>
</form>

<script>
    function validateNumber(input) {
        // 사용자가 숫자가 아닌 값을 입력할 경우 빈 문자열로 설정
        if (isNaN(input.value) || input.value.trim() === '') {
            input.value = '';
            alert('숫자만 입력할 수 있습니다.');
        }
    }

    function validateForm(form) {
        if (!form.title.value) {
            alert("제목을 입력하세요");
            form.title.focus();
            return false;
        } else if (!form.dates.value){
            alert("날짜를 입력하세요");
            form.dates.focus();
            return false;
        }
        else if (!form.sport.value){
            return false;
            alert("종목을 선택하세요");
            form.sport.focus();
            return false;
        }
        else if (!form.people.value || isNaN(form.people.value)) {
            alert("모집 인원 수를 정확히 입력해주세요.");
            form.people.focus();
            return false;
        }
        else if (!form.detail.value) {
            alert("세부내용을 입력하세요");
            form.detail.focus();
            return false;
        }
    }
    // 현재 날짜를 기준으로 최대 2달까지 선택가능
    const today = new Date();
    const twoMonthsLater = new Date(today);
    twoMonthsLater.setMonth(today.getMonth() + 2);

    const formatDate = (date) => {
        return date.toISOString().split('T')[0];
    };

    document.getElementById('dates').setAttribute('min', formatDate(today));
    document.getElementById('dates').setAttribute('max', formatDate(twoMonthsLater));

</script>

</body>

</html>
