package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.T_Dao;

public class T_cartUpdateCommand implements ACommand {
    private String pid;

    public T_cartUpdateCommand(String pid) {
        this.pid = pid;
    }

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String countParam = request.getParameter("count_" + pid);
        if (countParam != null) {
            int count = Integer.parseInt(countParam);
            T_Dao dao = new T_Dao();
            dao.update(pid, count);
        }
    }
}
