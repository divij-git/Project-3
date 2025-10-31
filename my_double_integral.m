function W = my_double_integral(u, A, B, G, H)
    function val = inner_integral(x)
        if isa(G, 'function_handle')
            g = G(x);
        else
            g = G;
        end
        if isa(H, 'function_handle')
            h = H(x);
        else
            h = H;
        end
        val = my_single_integral(@(y) u(x, y), g, h);
    end
    W = my_single_integral(@inner_integral, A, B);
end
