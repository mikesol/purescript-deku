module Deku.DOM.Attr.Span where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Span = Span

instance Attr Col_ Span String where
  attr Span bothValues  = unsafeAttribute $ Both { key: "span", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "span", value:  prop' value  })
  pureAttr Span value  = unsafeAttribute $ This { key: "span", value:  prop' value  }
  unpureAttr Span eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "span", value:  prop' value  }

instance Attr Colgroup_ Span String where
  attr Span bothValues  = unsafeAttribute $ Both { key: "span", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "span", value:  prop' value  })
  pureAttr Span value  = unsafeAttribute $ This { key: "span", value:  prop' value  }
  unpureAttr Span eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "span", value:  prop' value  }

instance Attr everything Span Unit where
  attr Span bothValues  = unsafeAttribute $ Both { key: "span", value:  unset'  } (snd bothValues <#> \_ -> { key: "span", value:  unset'  })
  pureAttr Span _  = unsafeAttribute $ This { key: "span", value:  unset'  }
  unpureAttr Span eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "span", value:  unset'  }
