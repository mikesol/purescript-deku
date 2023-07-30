module Deku.DOM.Attr.OnSelectionchange where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSelectionchange = OnSelectionchange

instance Attr anything OnSelectionchange Cb where
  attr OnSelectionchange bothValues  = unsafeAttribute $ Both { key: "selectionchange", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "selectionchange", value:  cb' value  })
  pureAttr OnSelectionchange value  = unsafeAttribute $ This { key: "selectionchange", value:  cb' value  }
  unpureAttr OnSelectionchange eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "selectionchange", value:  cb' value  }

instance Attr anything OnSelectionchange (Effect Unit) where
  attr OnSelectionchange bothValues  = unsafeAttribute $ Both { key: "selectionchange", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "selectionchange", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnSelectionchange value  = unsafeAttribute $ This { key: "selectionchange", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnSelectionchange eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "selectionchange", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnSelectionchange (Effect Boolean) where
  attr OnSelectionchange bothValues  = unsafeAttribute $ Both { key: "selectionchange", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "selectionchange", value:  cb' (Cb (const value))  })
  pureAttr OnSelectionchange value  = unsafeAttribute $ This { key: "selectionchange", value:  cb' (Cb (const value))  }
  unpureAttr OnSelectionchange eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "selectionchange", value:  cb' (Cb (const value))  }

type OnSelectionchangeEffect =
  forall element
   . Attr element OnSelectionchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelectionchange Unit where
  attr OnSelectionchange bothValues  = unsafeAttribute $ Both { key: "selectionchange", value:  unset'  } (snd bothValues <#> \_ -> { key: "selectionchange", value:  unset'  })
  pureAttr OnSelectionchange _  = unsafeAttribute $ This { key: "selectionchange", value:  unset'  }
  unpureAttr OnSelectionchange eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "selectionchange", value:  unset'  }
