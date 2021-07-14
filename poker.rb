
class Poker
    def parse(hs)
        handy={}
        h=0
        jqka={'J':11,'Q':12,'K':13,'A':14}
        hs.each do |i| 
            handy[h]=[[],[]]
            i.each do |v|
                v=[v[0..-2],v[-1]]
                if v[0].downcase == v[0] # JKQA
                    handy[h][0] << v[0].to_i 
                else
                    x= jqka[v[0].to_sym]
                    handy[h][0] << x
                end
                handy[h][1] << v[1]
            end
            nums= handy[h][0].sort
            if nums.index(14) && (nums - [14]).sort == [2,3,4,5]
                nums[-1]= 1 
                handy[h][0]=nums
            end
            h=h.next
        end
        handy
    end

    def initialize(hands)
        @original=hands
        @hands= parse(hands)
    end

    def isflush?(cards)
        symbols=cards[1]
        v=symbols.uniq.size == 1 ? cards[0].max * 99 : 0 
    end

    def isfull?(cards)
        cards=cards[0]
        cards= cards.inject(Hash.new(0)) {|h,v| h[v] += 1; h } #DRY# 
        (cards.values.any? 3) && (cards.keys.size == 2) ? cards.key(3) * 600 : 0          
    end
    
    def isfourk?(cards)
        cards=cards[0]
        cards= cards.inject(Hash.new(0)) {|h,v| h[v] += 1; h } #
        (cards.values.any? 4) ? cards.key(4) * 1100 : 0  
    end

    def isthreeortwo(cards)
        cards=cards[0]
        if cards.uniq.length == 3
            cards2= cards.inject(Hash.new(0)) {|h,v| h[v] += 1; h } #
            if cards2.values.max < 3 
                x= cards.sort
                f= [(cards.detect {|e| cards.rindex(e) != cards.index(e) })] #
                y= x-f
                z=  [(y.detect {|e| y.rindex(e) != y.index(e)})] #
                290 * z[0] + 30*f[0]  
            else cards2.key(3) * 2225 
            end
        else  0
        end
    end

    def issorsf?(cards) 
        w= cards[0]
        s= cards[1]
        x= s.uniq.size == 1 ? true : false
        cond= w.sort.slice_when{|prev,cur| cur != prev + 1}
        k= cond.count == 1  && (w.uniq.size == 5) ? true : false
        xk= x and k
        z=0
        z= z+ 9999 * w.max if xk
        z= z+ 2245 * w.max if ( k and not xk )    
        z
    end

    def pair?(cards)
        c= cards[0]
        u= c.uniq
        u.size == 4 ? (c.detect {|e| c.rindex(e) != c.index(e) }) * 60 : 0      
    end
    
    def highest(cards)
        x=cards[0].sort
        x[4]* 60 + x[3] * 4 + x[2]*3 + x[1] * 2 + x[0] 
    end

    def best_hand
        if @original.size <2
            @original
        else
            @hands.each do |h|
                m= [:isflush?, :isfull?, :isfourk?, :isthreeortwo, :issorsf?, :pair?, :highest].map {|m| method(m).call(h[1]) } 
                @hands[h[0]] << m.sum     
            end
            result = @hands.map {|r| r[1][2]  }
            max= result.index(result.max)
            equalities = result.count(result.max)
            
            if equalities == 1 
                return [@original[max]]
            else 
                r=[]
                @hands.each do |i|
                    i[1][2] == result.max ? r[i[0]]=@original[i[0]] : "Something went wrong."                    
                end
                r
            end
        end   
    end
end
