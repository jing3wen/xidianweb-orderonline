package com.byh.orderonline.service.impl;

import com.byh.orderonline.dao.OrderMapper;
import com.byh.orderonline.pojo.Customer;
import com.byh.orderonline.pojo.Order;
import com.byh.orderonline.pojo.OrderExample;
import com.byh.orderonline.pojo.OrderItem;
import com.byh.orderonline.service.CustomerService;
import com.byh.orderonline.service.OrderItemService;
import com.byh.orderonline.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    CustomerService customerService;
    @Autowired
    OrderItemService orderItemService;

    @Override
    public void save(Order c) {
        orderMapper.insert(c);
    }

    @Override
    public void del(int id) {
        orderMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Order c) {
        orderMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public Order get(int id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    public List<Order> list(){
        OrderExample example =new OrderExample();
        example.setOrderByClause("id desc");
        List<Order> result =orderMapper.selectByExample(example);
        setCust(result);
        return result;
    }
    //给每个订单设置客户
    public void setCust(List<Order> os){
        for (Order o : os)
            setCust(o);
    }
    //给客户实体设置客户
    public void setCust(Order o){
        int cstid = o.getCstid();
        Customer customer = customerService.get(cstid);
        o.setCustomer(customer);
    }

    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    @Override
    public float add(Order o, List<OrderItem> ois) {
        float total = 0;
        save(o);//新增订单数据

        if(false)
            throw new RuntimeException(); //用来模拟当增加订单后出现异常，观察事务管理是否预期发生。（需要把false修改为true才能观察到）

        for (OrderItem oi: ois) {
            oi.setOid(o.getId());//给订单项设置订单id 关联起来
            orderItemService.update(oi);
            total+=oi.getProduct().getPrice()*oi.getNumber();//商品的价格+当前订单项购买数量
        }
        return total;
    }

    @Override
    public List<Order> list(int cstid) {
        OrderExample example =new OrderExample();
        example.createCriteria().andCstidEqualTo(cstid);
        example.setOrderByClause("id asc");
        return orderMapper.selectByExample(example);
    }

}
