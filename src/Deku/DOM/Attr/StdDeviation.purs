module Deku.DOM.Attr.StdDeviation where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StdDeviation = StdDeviation

instance Attr FeDropShadow_ StdDeviation String where
  attr StdDeviation bothValues  = unsafeAttribute $ Both { key: "stdDeviation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "stdDeviation", value:  prop' value  })
  pureAttr StdDeviation value  = unsafeAttribute $ This { key: "stdDeviation", value:  prop' value  }
  unpureAttr StdDeviation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "stdDeviation", value:  prop' value  }

instance Attr FeGaussianBlur_ StdDeviation String where
  attr StdDeviation bothValues  = unsafeAttribute $ Both { key: "stdDeviation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "stdDeviation", value:  prop' value  })
  pureAttr StdDeviation value  = unsafeAttribute $ This { key: "stdDeviation", value:  prop' value  }
  unpureAttr StdDeviation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "stdDeviation", value:  prop' value  }

instance Attr everything StdDeviation Unit where
  attr StdDeviation bothValues  = unsafeAttribute $ Both { key: "stdDeviation", value:  unset'  } (snd bothValues <#> \_ -> { key: "stdDeviation", value:  unset'  })
  pureAttr StdDeviation _  = unsafeAttribute $ This { key: "stdDeviation", value:  unset'  }
  unpureAttr StdDeviation eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "stdDeviation", value:  unset'  }
