
## git log 

 이 앱은 Wikipedia API를 Search Bar를 통해 검색합니다. 글자를 입력할때마다 Wiki API에 있는 단어가 검색되어 반응형으로 출력됩니다. 검색어가 없게되면 Firebase Realtime Database에 저장되어있는 최근검색어 리스트가 출력되며, Enter키 또는 x버튼을 눌러서 실시간으로 데이터베이스에 있는 최근검색어 데이터를 추가 또는 삭제할 수 있습니다. 
 
 

```
commit 5b2cfed8e630ce445cace32bca43a7bdef3f0d5d
프로젝트 생성
```

```
commit 7b98d37cf79708824b37360602ecdd0ae1f83b1d
더미데이터 생성
```
 
``` 
commit 564cea1a36c74f0c00dccee0007621f74f07c4e1
searchbar local basic 구현 완료
```

```
commit c1aec77910beea057287ba1ab6e62871522d27db
Alamofire적용, API TEST VC생성
```

```
commit 11aa24fba7524a3efc39470594aaf31351d21df0
Data pasing 과정에서 문제발생, 모델링에 어려움을 겪고있음
- 문제해결
- codable을 활용하여 pasing하였고 기존 key값이 있던 일반적인 data와는 다르게 결과값이 배열로만 넘어와서 힘들었음. 
- codable model구현시 키값이 없어서 매칭이 안되는 부분을 초기화를 할때, 파싱되는 쪽으로 값을 넣으라고 수동으로 init해줌.
```

```
commit f0e1e64c9ba9799d800ce3e577b7de872291d16d (HEAD -> master, origin/master, origin/HEAD)
JSONSerialization을 활용한 pasing 구현
- 데이터파싱방법 기존 codable활용에서 JSONSerialization로 변경 
- 기존 일반적인 json파일처럼 key값이 없고, model.swift를 따로 만들 필요가 없을 것으로 판단함.
```

```
commit 1d4d83d4255e42d73b9f5e8fe8b79577fce9be1a
네트워킹 구조변경 Alamofire->URLSession
- 굳이 엄청나게 크면서 내가 전부다 알지못하는 라이브러리를 쓰는 대신 URLSession로 구조변경함. 
```

```
commit 0a74e810c58d6095fd5b617df34b25c119a5c305
testapi 파일 viewcontroller에 적용구현
```

```
commit 750d8607c7171113193eb09ee793a6a476a10872
api연동 검색기능 구현
```

```
commit c2c74f2346488fcbdfd75808fc856cd7d175b1fe
firebase reamtimeDB import
```

```
commit bb904f6a12313281db35f4696c6bbc35c87d49af
customcell 생성
- 문제점 
- 기존 검색 cell과 customcell을 어떤 기준으로 나눠서 다시 뿌려줄 것인지 
```


```
commit fe3058355fd932747e9f481ef0513015a0d4974c (HEAD -> master, origin/master, origin/HEAD)
firebase data연동 삭제기능추가
```

```
commit d699020cb2755896c8d687c78b384d3ef5a2a788
api검색기능, db연동기능 완료
- 문제해결사항 
- searbar내 seartext가 nil이면 앱이 꺼져버리는 상태 개선(searchbardelegate에 bool 인스턴스 이용)
- searbar내 seartext가 nil이면 placeholder에 "검색어입력안내문구 추가"
- tableview cellForRowAt에서 bool인스턴스를 통해 firebasedb custom cell과 기존 wiki api cell을 구분하여 뿌려줄 수 있도록 구현 
```

```
개선해야 할 기능
- wiki api cell 도 커스텀으로 구현(해결)
- 글자수 입력될때마다 입력된것만 글자색 변경
- 검색결과 20개만 보여주기(해결)
- 검색어 최근순으로 보여주기(해결) 
- x버튼 누르면 최근검색어 삭제 잘되나 tableview reload 안되는점 개선(해결)
- searchbar 요구사항 이미지처럼 커스텀으로 바꾸기 
```

```
commit 5fc4c49d3612cfc2f2e8cc0ae885792f48a25013
검색결과 20개만보여주기 해결
```

```   
commit 8178f189652a08e2b3f1c9c8d13370cd6b687b46
wiki api cell 도 커스텀으로 구현
```  

```   
commit 06b22244e2d1475180fa94bbb11e729a841532f6
주석 추가
```  

```   
commit 8e4713bb29c21691b3e5f74ee7656c1a7bdda923 (HEAD -> master, origin/master, origin/HEAD)
검색어 최신순보여주기 해결
```  


