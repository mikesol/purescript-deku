module Deku.DOM.Attr.OnCancel where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnCancel = OnCancel

instance Attr anything OnCancel Cb where
  attr OnCancel bothValues  = unsafeAttribute $ Both { key: "cancel", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "cancel", value:  cb' value  })
  pureAttr OnCancel value  = unsafeAttribute $ This { key: "cancel", value:  cb' value  }
  unpureAttr OnCancel eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "cancel", value:  cb' value  }

instance Attr anything OnCancel (Effect Unit) where
  attr OnCancel bothValues  = unsafeAttribute $ Both { key: "cancel", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "cancel", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnCancel value  = unsafeAttribute $ This { key: "cancel", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnCancel eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "cancel", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnCancel (Effect Boolean) where
  attr OnCancel bothValues  = unsafeAttribute $ Both { key: "cancel", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "cancel", value:  cb' (Cb (const value))  })
  pureAttr OnCancel value  = unsafeAttribute $ This { key: "cancel", value:  cb' (Cb (const value))  }
  unpureAttr OnCancel eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "cancel", value:  cb' (Cb (const value))  }

type OnCancelEffect =
  forall element
   . Attr element OnCancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCancel Unit where
  attr OnCancel bothValues  = unsafeAttribute $ Both { key: "cancel", value:  unset'  } (snd bothValues <#> \_ -> { key: "cancel", value:  unset'  })
  pureAttr OnCancel _  = unsafeAttribute $ This { key: "cancel", value:  unset'  }
  unpureAttr OnCancel eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "cancel", value:  unset'  }
