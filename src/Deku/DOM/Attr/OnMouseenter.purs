module Deku.DOM.Attr.OnMouseenter where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseenter = OnMouseenter

instance Attr anything OnMouseenter Cb where
  attr OnMouseenter bothValues  = unsafeAttribute $ Both { key: "mouseenter", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "mouseenter", value:  cb' value  })
  pureAttr OnMouseenter value  = unsafeAttribute $ This { key: "mouseenter", value:  cb' value  }
  unpureAttr OnMouseenter eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseenter", value:  cb' value  }

instance Attr anything OnMouseenter (Effect Unit) where
  attr OnMouseenter bothValues  = unsafeAttribute $ Both { key: "mouseenter", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "mouseenter", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnMouseenter value  = unsafeAttribute $ This { key: "mouseenter", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnMouseenter eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseenter", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnMouseenter (Effect Boolean) where
  attr OnMouseenter bothValues  = unsafeAttribute $ Both { key: "mouseenter", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "mouseenter", value:  cb' (Cb (const value))  })
  pureAttr OnMouseenter value  = unsafeAttribute $ This { key: "mouseenter", value:  cb' (Cb (const value))  }
  unpureAttr OnMouseenter eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseenter", value:  cb' (Cb (const value))  }

type OnMouseenterEffect =
  forall element
   . Attr element OnMouseenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseenter Unit where
  attr OnMouseenter bothValues  = unsafeAttribute $ Both { key: "mouseenter", value:  unset'  } (snd bothValues <#> \_ -> { key: "mouseenter", value:  unset'  })
  pureAttr OnMouseenter _  = unsafeAttribute $ This { key: "mouseenter", value:  unset'  }
  unpureAttr OnMouseenter eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "mouseenter", value:  unset'  }
