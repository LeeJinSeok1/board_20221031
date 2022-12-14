package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
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
    public String saveBoard(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.saveBoard(boardDTO);

            return "redirect:index";


    }


    @GetMapping("/detail")
    public String find(@RequestParam("id") Long id,
                       @RequestParam(value = "page", required = false,
                               defaultValue = "1") int page,Model model){
        boardService.hits(id);
         BoardDTO result =boardService.find(id);
         model.addAttribute("bd",result);
         model.addAttribute("page",page);
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
    @GetMapping("/find")
    public String findBoard(Model model){
        List<BoardDTO> result = boardService.findBoard();
        System.out.println(result);
        model.addAttribute("model",result);

        return "boardList";

    }

    @GetMapping("/paging")
    public String paging(Model model,@RequestParam(value = "page", required = false,
                                                   defaultValue = "1") int page){
        // ????????? ???????????? ?????? ????????????, required??? ??????????????? ??????????????? ?????????
        // (false) ?????? ????????? ????????? ??????. ????????? ????????? ????????? ???????????? dafaultValue
        // ??????????????? 1??? ????????? ?????? ???
//        System.out.println(" page = " + page);

        // ?????? ??????????????? ????????? ??? ??????
        List<BoardDTO> pagingList = boardService.pagingList(page);
//        // ?????? ????????? ?????? ????????? ?????? ?????????
        PageDTO pageDTO = boardService.pagingParam(page);
        model.addAttribute("boardList",pagingList);
        model.addAttribute("paging",pageDTO);

        return "boardPaging";

    }


}
