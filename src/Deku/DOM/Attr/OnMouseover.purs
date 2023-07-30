module Deku.DOM.Attr.OnMouseover where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseover = OnMouseover

instance Attr anything OnMouseover Cb where
  attr OnMouseover bothValues  = unsafeAttribute $ Both { key: "mouseover", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "mouseover", value:  cb' value  })
  pureAttr OnMouseover value  = unsafeAttribute $ This { key: "mouseover", value:  cb' value  }
  unpureAttr OnMouseover eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseover", value:  cb' value  }

instance Attr anything OnMouseover (Effect Unit) where
  attr OnMouseover bothValues  = unsafeAttribute $ Both { key: "mouseover", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "mouseover", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnMouseover value  = unsafeAttribute $ This { key: "mouseover", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnMouseover eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseover", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnMouseover (Effect Boolean) where
  attr OnMouseover bothValues  = unsafeAttribute $ Both { key: "mouseover", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "mouseover", value:  cb' (Cb (const value))  })
  pureAttr OnMouseover value  = unsafeAttribute $ This { key: "mouseover", value:  cb' (Cb (const value))  }
  unpureAttr OnMouseover eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseover", value:  cb' (Cb (const value))  }

type OnMouseoverEffect =
  forall element
   . Attr element OnMouseover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseover Unit where
  attr OnMouseover bothValues  = unsafeAttribute $ Both { key: "mouseover", value:  unset'  } (snd bothValues <#> \_ -> { key: "mouseover", value:  unset'  })
  pureAttr OnMouseover _  = unsafeAttribute $ This { key: "mouseover", value:  unset'  }
  unpureAttr OnMouseover eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "mouseover", value:  unset'  }
