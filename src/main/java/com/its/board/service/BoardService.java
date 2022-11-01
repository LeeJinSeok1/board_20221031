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

    public boolean update2(BoardDTO boardDTO) {
       int result=  boardRepository.update2(boardDTO);
       if(result>0){
           return true;
       }else{
           return false;
       }
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }


    public void hits(Long id) {
        boardRepository.hits(id);
    }
}
