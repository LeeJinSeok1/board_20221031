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

    public int update2(BoardDTO boardDTO) {
        int result= sql.update("board.update2",boardDTO);
        return result;
    }

    public void delete(Long id) {
        sql.delete("board.delete",id);
    }


    public void hits(Long id) {
        sql.update("board.hits",id);
    }
}
