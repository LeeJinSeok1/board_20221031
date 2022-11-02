package com.its.board.repository;

import com.its.board.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private  SqlSessionTemplate sql;

    public int saveBoard(BoardDTO boardDTO) {
        return  sql.insert("board.saveBoard",boardDTO);
    }

    public List<BoardDTO> findBoard() {
        return  sql.selectList("board.findBoard");
    }

    public BoardDTO find(Long id) {
        return  sql.selectOne("board.find",id);
    }

    public BoardDTO update(Long id) {
        return  sql.selectOne("board.update",id);
    }

    public void update2(BoardDTO boardDTO) {
        sql.update("board.update2",boardDTO);

    }



    public void hits(Long id) {
        sql.update("board.hits",id);
    }



    public BoardDTO findId(Long id) {
        return  sql.selectOne("board.findId",id);
    }

    public BoardDTO ckPass(BoardDTO boardDTO) {
         BoardDTO result = sql.selectOne("board.ckPass",boardDTO);
         return  result;
    }

    public void delete(Long id) {
        sql.delete("board.delete",id);
    }

    public int ck(BoardDTO boardDTO) {
        int result = sql.selectOne("board.ck",boardDTO);
        return result;
    }
}
