package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
   @Autowired
   BoardRepository boardRepository;
    public boolean saveBoard(BoardDTO boardDTO) {
      int result =  boardRepository.saveBoard(boardDTO);
      if(result>0){
          return true;
      }else
          return false;
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
}
