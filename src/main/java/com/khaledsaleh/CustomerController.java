package com.khaledsaleh;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/customers")
@CrossOrigin
public class CustomerController {
    private final CustomerRepository customerRepository;

    public CustomerController(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }
    @GetMapping("")
    public List<Customer> getCustomers(){
        return customerRepository.findAll();
    }

    @PostMapping("")
    public void addCustomer(@RequestBody NewCustomerRequest request){
        Customer customer = new Customer();
        customer.setName(request.name());
        customer.setAge(request.age());
        customer.setEmail(request.email());
        customerRepository.save(customer);
    }

    @DeleteMapping("/{id}")
    public void deleteCustomer(@PathVariable("id") Integer id){
        customerRepository.deleteById(id);
    }
    @PutMapping("/{id}")
    public void updateCustomer(@RequestBody NewCustomerRequest request, @PathVariable("id") Integer id){
        if (customerRepository.existsById(id)){
            customerRepository.deleteById(id);
        }
        addCustomer(request);
    }
}
