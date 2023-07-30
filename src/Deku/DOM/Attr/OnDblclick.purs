module Deku.DOM.Attr.OnDblclick where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDblclick = OnDblclick

instance Attr anything OnDblclick Cb where
  attr OnDblclick bothValues  = unsafeAttribute $ Both { key: "dblclick", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "dblclick", value:  cb' value  })
  pureAttr OnDblclick value  = unsafeAttribute $ This { key: "dblclick", value:  cb' value  }
  unpureAttr OnDblclick eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dblclick", value:  cb' value  }

instance Attr anything OnDblclick (Effect Unit) where
  attr OnDblclick bothValues  = unsafeAttribute $ Both { key: "dblclick", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "dblclick", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnDblclick value  = unsafeAttribute $ This { key: "dblclick", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnDblclick eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dblclick", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnDblclick (Effect Boolean) where
  attr OnDblclick bothValues  = unsafeAttribute $ Both { key: "dblclick", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "dblclick", value:  cb' (Cb (const value))  })
  pureAttr OnDblclick value  = unsafeAttribute $ This { key: "dblclick", value:  cb' (Cb (const value))  }
  unpureAttr OnDblclick eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dblclick", value:  cb' (Cb (const value))  }

type OnDblclickEffect =
  forall element
   . Attr element OnDblclick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDblclick Unit where
  attr OnDblclick bothValues  = unsafeAttribute $ Both { key: "dblclick", value:  unset'  } (snd bothValues <#> \_ -> { key: "dblclick", value:  unset'  })
  pureAttr OnDblclick _  = unsafeAttribute $ This { key: "dblclick", value:  unset'  }
  unpureAttr OnDblclick eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "dblclick", value:  unset'  }
