package com.javalec.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.T_Dao;

public class T_updatePstockCommand implements ACommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int count = 0;
        List<String> pidList = new ArrayList<>();

        if (request.getParameter("count") != null) {
            String countParameter = request.getParameter("count");
            if (!countParameter.isEmpty()) {
                count = Integer.parseInt(countParameter);
            }
        }

        String[] pids = request.getParameterValues("pid");
        if (pids != null && pids.length > 0) {
            for (String pid : pids) {
                pidList.add(pid);
            }
        }

        T_Dao dao = new T_Dao();
        dao.updatePstock(pidList, count);

        // 오류 발생 시 처리 방법 추가
        try {
            // 성공적으로 주문되었다는 메시지 등을 설정하거나 리디렉션할 수 있습니다.
            response.getWriter().println("재고 업데이트가 성공적으로 완료되었습니다.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
