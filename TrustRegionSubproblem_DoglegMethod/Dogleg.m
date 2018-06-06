function p_opt = Dogleg(x, delta)
gam = 0;
[~, g, H] = F_Grad_Hessian(x);
p_B=-H\g;
p_U=-g*g'*g/(g'*H*g);

if norm(p_B) <= delta
    p_opt = p_B;
else if norm(p_U) > delta
        gam = delta/norm(p_U);
        p_opt = gam * p_U;
    else
        while (norm(p_U + (p_B - p_U)*(gam -1)) - delta)*...
                (norm(p_U + (p_B - p_U)*(gam+0.001 -1)) - delta) > 0
        gam = gam + 0.001;
        end
        p_opt = p_U + (p_B - p_U)*(gam -1);
    end
end

end