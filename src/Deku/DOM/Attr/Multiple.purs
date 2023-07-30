module Deku.DOM.Attr.Multiple where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Multiple = Multiple

instance Attr Input_ Multiple String where
  attr Multiple bothValues  = unsafeAttribute $ Both { key: "multiple", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "multiple", value:  prop' value  })
  pureAttr Multiple value  = unsafeAttribute $ This { key: "multiple", value:  prop' value  }
  unpureAttr Multiple eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "multiple", value:  prop' value  }

instance Attr Select_ Multiple String where
  attr Multiple bothValues  = unsafeAttribute $ Both { key: "multiple", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "multiple", value:  prop' value  })
  pureAttr Multiple value  = unsafeAttribute $ This { key: "multiple", value:  prop' value  }
  unpureAttr Multiple eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "multiple", value:  prop' value  }

instance Attr everything Multiple Unit where
  attr Multiple bothValues  = unsafeAttribute $ Both { key: "multiple", value:  unset'  } (snd bothValues <#> \_ -> { key: "multiple", value:  unset'  })
  pureAttr Multiple _  = unsafeAttribute $ This { key: "multiple", value:  unset'  }
  unpureAttr Multiple eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "multiple", value:  unset'  }
