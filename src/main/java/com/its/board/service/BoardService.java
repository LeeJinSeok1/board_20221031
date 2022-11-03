package com.its.board.service;

import com.its.board.commons.PagingConst;
import com.its.board.dto.BoardDTO;
import com.its.board.dto.PageDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
   @Autowired
   BoardRepository boardRepository;
    public void saveBoard(BoardDTO boardDTO) throws IOException {
        /*
         *  1. BoardDTO 객체에 담긴 파일을 꺼냄
         *  2. 파일의 원본 이름을 가져옴. - originalFileName
         *  3. 서보 관리용 이름으로 만듦. - storedFileName
         *  4. originalFileName, storedFileName을 DTO 객체에 다음
         *  5. 파일 실제 저장 위치 지정.
         *  6. 파일 저장 처리.
         *  7. repositroy로 DTO 객체 전달
         * */
        if(!boardDTO.getBoardFile().isEmpty()) {
            System.out.println("파일있음");
            MultipartFile boardFile = boardDTO.getBoardFile();   // 1.
//            1. BoardDTO 객체에 담긴 파일을 꺼냄
            String originalFilename = boardFile.getOriginalFilename();  // 2.
//            2. 파일의 원본 이름을 가져옴. - originalFileName
            System.out.println("original = " + originalFilename);
            System.out.println(System.currentTimeMillis());
            // 1000m second 단위 1초를 1000번 나눈 (다른 이름값을 주기위해)

            String storedFileName = System.currentTimeMillis() + "-" + originalFilename; //3
            System.out.println("stored" + storedFileName);
//            3. 서보 관리용 이름으로 만듦. - storedFileName


            boardDTO.setOriginalFileName(originalFilename); //4.
            boardDTO.setStoredFileName(storedFileName);  //4.
//            4. originalFileName, storedFileName을 DTO 객체에 다음

            String savePath = "D:\\spring_img\\" + storedFileName; //5.
//            5. 파일 실제 저장 위치 지정.

            boardDTO.setFileAttached(1);

            boardFile.transferTo(new File(savePath)); //6.
//            6. 파일 저장 처리.

            BoardDTO savedBoard = boardRepository.saveBoard(boardDTO); //7.
            boardRepository.saveFileName(savedBoard);
//            7. repositroy로 DTO 객체 전달
        } else {
            System.out.println("파일없음");
            boardDTO.setFileAttached(0);
            boardRepository.saveBoard(boardDTO);
        }


//        int result =  boardRepository.saveBoard(boardDTO);
//      if(result>0){
//          return true;
//      }else
//          return false;
//    }
//        return  true;
    }

    public List<BoardDTO> findBoard() {
        return boardRepository.findBoard();
    }

    public BoardDTO find(Long id) {
        return  boardRepository.find(id);
    }

    public BoardDTO update(Long id) {
        return boardRepository.update(id);
    }

    public void update2(BoardDTO boardDTO) {
        boardRepository.update2(boardDTO);
    }




    public void hits(Long id) {
        boardRepository.hits(id);
    }




    public BoardDTO findId(Long id) {
        return  boardRepository.findId(id);
    }


    public BoardDTO ckPass(BoardDTO boardDTO) {
       return boardRepository.ckPass(boardDTO);

    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public boolean ck(BoardDTO boardDTO) {
        int result = boardRepository.ck(boardDTO);
        if(result>0){
            return  true;
        }else{
            return false;
        }
    }

    public List<BoardDTO> pagingList(int page) {
        /*
        * page=1, 0
        * page=2, 3
        * page=3, 6
        * */
        int pagingStart = (page-1) * PagingConst.PAGE_LIMIT;
        Map<String,Integer> pagingParams = new HashMap<>();
        pagingParams.put("start",pagingStart);
        pagingParams.put("limit",PagingConst.PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParams);
        return  pagingList;

    }

    public PageDTO pagingParam(int page) {
        //전체 페이지 갯 수 조회
       int boardCount= boardRepository.boardCount();
       // 전체 페이지 갯수 계산
        int maxPage = (int) (Math.ceil((double) boardCount / PagingConst.PAGE_LIMIT)); //Mate.ceil은 올림처리
        // 시작 페이지 값 계산 (1, 4, 7, 10, ~~~)
        int startPage = (((int)(Math.ceil((double) page / PagingConst.BLOCK_LIMIT))) - 1) * PagingConst.BLOCK_LIMIT + 1;
        // 끝 페이지 값 계산 (3, 6, 9, 12, ~~~~)
        int endPage = startPage + PagingConst.BLOCK_LIMIT - 1;
        if(endPage> maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);


        return pageDTO;
    }
}
