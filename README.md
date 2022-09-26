# Nano-Challenge-2
Apple Developer Academy 활동 중 Nano Challenge 2에 대한 기록

## CeateML을 활용한 App 개발
뉴스 기사 카테고리 분류를 이용한 Text Classification 앱  
사용한 데이터 셋 : AIHub에 있는 뉴스 기사 Text 데이터셋 활용

### 데이터 설명
• 입출력
- Input : 뉴스 기사 텍스트 데이터
- Output : 카테고리 (6가지) - '경제', '사회', '생활', '스포츠', '연예/문화', '정치' 중 하나
 
• 데이터셋 구성
 
• Train
- train.csv: 37,648개의 뉴스 기사 텍스트('text')와 6 가지 중 하나의 카테고리('category')가 담긴 csv 파일
 
• Test
- test.csv: 3,103개의 뉴스 기사 텍스트('text')가 담긴 csv 파일

### 앱 화면
<p>
<img width="200" src="https://user-images.githubusercontent.com/29690062/192279304-686e7451-e5ff-4fd2-bf43-b0b3bdb6cc71.png">
<img width="200" src="https://user-images.githubusercontent.com/29690062/192280595-2706fd63-83e4-4ab0-8bea-db1bdb642d55.png">
</p>

## Coremltools를 이용한 convert PyTorch to CoreML
이미지를 보여주면 해당 이미지와 관련된 시를 작성해주는 서비스  
= 이미지를 보고 캡션을 생성하는 모델 + 한 문장을 기준으로 시를 생성하는 모델 

![image](https://user-images.githubusercontent.com/29690062/192280323-0a142dab-2737-4886-a1f8-926c1666b35b.png)


• 참고한 모델  
- [이미지를 보고 캡션을 생성하는 모델](https://huggingface.co/ddobokki/vision-encoder-decoder-vit-gpt2-coco-ko)
- [Text를 받아서 시를 생성하는 모델](https://huggingface.co/ddobokki/gpt2_poem)

• 내용  
- Google Colab 런타임 유형 GPU로 세팅하여 사용
- torch.jit.trace 과정에서 메모리 초과로 진행 불가..
