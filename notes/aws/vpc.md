# Example VPC layouts

## Multi-region, multi-AZ

- All: 10.0.0.0/8
  - Environment: 10.0.0.0/11 (max: 8)
    - Application (VPC): 10.0.0.0/15 (max: 16)
      - Region: 10.0.0.0/17 (max: 4)
        - Availability Zone: 10.0.0.0/19 (max: 4)
          - Subnet Type: 10.0.0.0/21 (max 4)
            - Instance IPs (max: 2048)

## References

- http://www.subnet-calculator.com/cidr.php
