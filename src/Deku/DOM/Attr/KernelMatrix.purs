module Deku.DOM.Attr.KernelMatrix where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KernelMatrix = KernelMatrix

instance Attr FeConvolveMatrix_ KernelMatrix String where
  attr KernelMatrix bothValues  = unsafeAttribute $ Both { key: "kernelMatrix", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "kernelMatrix", value:  prop' value  })
  pureAttr KernelMatrix value  = unsafeAttribute $ This { key: "kernelMatrix", value:  prop' value  }
  unpureAttr KernelMatrix eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "kernelMatrix", value:  prop' value  }

instance Attr everything KernelMatrix Unit where
  attr KernelMatrix bothValues  = unsafeAttribute $ Both { key: "kernelMatrix", value:  unset'  } (snd bothValues <#> \_ -> { key: "kernelMatrix", value:  unset'  })
  pureAttr KernelMatrix _  = unsafeAttribute $ This { key: "kernelMatrix", value:  unset'  }
  unpureAttr KernelMatrix eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "kernelMatrix", value:  unset'  }
