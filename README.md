# 토이 프로젝트 🛹
<p align="center">
  <img src="https://github.com/user-attachments/assets/eaf848a5-3ee9-480d-b2f2-3deab64bac30" alt="프로젝트 이미지" width="300" height="300"/>
</p>

# bookBell 📖
<p>
  개인프로젝트 <p></p>
  개발기간: 2024.07 ~ 2024.09 <p></p>
  기술스택: <p></p>
  <img width="100"src="https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white">
    <img width="100" src="https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black"/>
    <img width="100"  src="https://img.shields.io/badge/Xcode-147EFB?style=flat-square&logo=Xcode&logoColor=white"/>

</p>


# 프로젝트 소개
관심있는 도서의 정보를 얻을수 있으며 커뮤니티를 통해 도서모임을 직접 생성및 가입할 수 있는 서비스.

  <img width="150" src="https://github.com/user-attachments/assets/51c5a7d6-4994-44fc-bfd4-697abfc0572a"/>
  <img width="150" src="https://github.com/user-attachments/assets/0662024a-1dda-4ca4-9af8-cee1c36320c3"/>
  <img width="150" src="https://github.com/user-attachments/assets/c7c6452f-9b3e-4d3e-958d-4e91b2c6b9e1"/>
  <img width="150" src="https://github.com/user-attachments/assets/6b297e7d-58fe-45a2-9db5-c9f780ab17ac"/>
  <img width="150" src="https://github.com/user-attachments/assets/cbc7279e-52d0-4cc5-9b70-c1e70e09d89a"/>
  <img width="150" src="https://github.com/user-attachments/assets/a2cd3f0b-9004-4f4b-b660-780d8054e046"/>







## ✳️ 구현 기능 ✳️ <br><br>
- ### ✏️Splash 화면 구현<br>
Rive_splash 라이브러리를 활용해 화면 구현 및 제어


- ###  ✏️로그인기능<br>
Firebase를 활용한 구글 로그인, 회원가입 로직 구현,  <br>
GetX, Provider과 같은 상태관리 라이브러리를 사용하여 로그인,로그아웃 여부를 구분할 수 있게 구현.

- ### ✏️검색기능
네이버 도서 검색 API를 활용하여 도서검색 로직 구현

- ### ✏️커뮤니티 형성 및 좋아요 기능 추가
파이어베이스에 현재 로그인된 유저를 확인 후 좋아요 한 책과 모임등록. CRUD 기능 구현
# 어려웠던 점과 이를 통해 배운점 <br>
1. ios앱 개발에서 Xcode와 파이어베이스 간 버전에러 발생 <br>
   해결방법: 연관된 라이브러리의 버전확인 후 Podinstall을 통해 에러파일들 수정함. 바코드를 통한 검색기능을 구현하였었는데 바코드 활용을 위한 라이브러리 에러였음을 확인 후 수정하였다. <br>
   해당 에러를 수정하며 xcode 활용법에 대해 익숙해질 수 있었다.
   
2. 네이버 API에서 받아온 특정 도서 정보를 파이어베이스에 등록하는 과정에서 특정 데이터를 가공및 추가 문제 발생 <br>
   해결방법: 익숙했던 Mysql, Oracle 과 달리 관계 데이터베이스가 아니다 보니 처음엔 쿼리 사용에 어려움이 있었다. 파이어베이스 문서를 통해 정보를 습득하며 공부했다.
    각 책의 정보에 '좋아요' 유무를 확인할 수 있는 필드가 필요하여서 따로 클래스를 생성해 파이어베이스 CRUD를 성공시킬수 있었다.

 


