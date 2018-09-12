![purpleworks](purpleworks.jpg)

# purpleworks


https://github.com/purpleworks/coding_test/blob/master/iOS/SearchTest/test.md

## git log 

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


