package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller

public class BoardController {
    @Autowired
    BoardService boardService;

    @GetMapping("/save")
    public String savePage() {
        return "boardPages/boardSave";
    }

    @PostMapping("/save")
    public String saveBoard(@ModelAttribute BoardDTO boardDTO) {
        boolean result = boardService.saveBoard(boardDTO);
        if(result){
           return  "index";
        }else{
            return "saveFail";
        }

    }
    @GetMapping("/find")
    public String findBoard(Model model){
        List<BoardDTO> result = boardService.findBoard();
        model.addAttribute("model",result);
        return "boardList";

    }

    @GetMapping("/detail")
    public String find(@RequestParam("id") Long id,Model model){
        boardService.hits(id);
         BoardDTO result =boardService.find(id);
         model.addAttribute("bd",result);
        return  "boardDetail";
    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Long id,Model model){
        BoardDTO result = boardService.update(id);
        model.addAttribute("bd",result);
        return "boardUpdate";

    }
    @PostMapping("/update2")
    public String update2(@ModelAttribute BoardDTO boardDTO){
        System.out.println("boardDTO = " + boardDTO);
        boardService.update2(boardDTO);
           return "redirect:find";

    }
    @GetMapping("/delete")
    public String findId(@RequestParam("id") Long id,Model model){
       BoardDTO boardDTO= boardService.findId(id);
       model.addAttribute("model",boardDTO);
        return "passCk";
    }
    @GetMapping("/DetailPage")
    public String dPage() {
        return "redirect:find";
    }
    @PostMapping("/del")
    public BoardDTO ckPass(@ModelAttribute BoardDTO boardDTO){
      BoardDTO result= boardService.ckPass(boardDTO);
        System.out.println("BoardController.ckPass");
       return result;
    }
    @GetMapping("/del2")
    public String delete(@RequestParam("id")Long id){
        boardService.delete(id);
    return "redirect:find";
    }


}
