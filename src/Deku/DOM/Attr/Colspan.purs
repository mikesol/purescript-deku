module Deku.DOM.Attr.Colspan where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Colspan = Colspan

instance Attr Td_ Colspan String where
  attr Colspan bothValues  = unsafeAttribute $ Both { key: "colspan", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "colspan", value:  prop' value  })
  pureAttr Colspan value  = unsafeAttribute $ This { key: "colspan", value:  prop' value  }
  unpureAttr Colspan eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "colspan", value:  prop' value  }

instance Attr Th_ Colspan String where
  attr Colspan bothValues  = unsafeAttribute $ Both { key: "colspan", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "colspan", value:  prop' value  })
  pureAttr Colspan value  = unsafeAttribute $ This { key: "colspan", value:  prop' value  }
  unpureAttr Colspan eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "colspan", value:  prop' value  }

instance Attr everything Colspan Unit where
  attr Colspan bothValues  = unsafeAttribute $ Both { key: "colspan", value:  unset'  } (snd bothValues <#> \_ -> { key: "colspan", value:  unset'  })
  pureAttr Colspan _  = unsafeAttribute $ This { key: "colspan", value:  unset'  }
  unpureAttr Colspan eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "colspan", value:  unset'  }
