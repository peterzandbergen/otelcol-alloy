workspace "name" "description" {
    !identifiers hierarchical
    !impliedRelationships true

    model {
        tester = person "Tester" "Human actor" 

        system1 = softwareSystem "system" "description" "tags" {
            
        }

        tester -> system1 "Uses"
        
    }
    views {
        systemContext system1 "name" "description" {
            include *
        }

    }
}
