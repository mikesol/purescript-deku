module Deku.DOM.Attr.OnMouseup where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseup = OnMouseup

instance Attr anything OnMouseup Cb where
  attr OnMouseup bothValues  = unsafeAttribute $ Both { key: "mouseup", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "mouseup", value:  cb' value  })
  pureAttr OnMouseup value  = unsafeAttribute $ This { key: "mouseup", value:  cb' value  }
  unpureAttr OnMouseup eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseup", value:  cb' value  }

instance Attr anything OnMouseup (Effect Unit) where
  attr OnMouseup bothValues  = unsafeAttribute $ Both { key: "mouseup", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "mouseup", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnMouseup value  = unsafeAttribute $ This { key: "mouseup", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnMouseup eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseup", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnMouseup (Effect Boolean) where
  attr OnMouseup bothValues  = unsafeAttribute $ Both { key: "mouseup", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "mouseup", value:  cb' (Cb (const value))  })
  pureAttr OnMouseup value  = unsafeAttribute $ This { key: "mouseup", value:  cb' (Cb (const value))  }
  unpureAttr OnMouseup eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseup", value:  cb' (Cb (const value))  }

type OnMouseupEffect =
  forall element
   . Attr element OnMouseup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseup Unit where
  attr OnMouseup bothValues  = unsafeAttribute $ Both { key: "mouseup", value:  unset'  } (snd bothValues <#> \_ -> { key: "mouseup", value:  unset'  })
  pureAttr OnMouseup _  = unsafeAttribute $ This { key: "mouseup", value:  unset'  }
  unpureAttr OnMouseup eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "mouseup", value:  unset'  }
