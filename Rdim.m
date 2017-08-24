function X=Rdim(X)
  X=permute(X,[length(size(X)):-1:1]);
  end
