module Deku.DOM.Attr.OnPointerout where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointerout = OnPointerout

instance Attr anything OnPointerout (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerout bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerout", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerout", value: cb' value })
instance Attr anything OnPointerout (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPointerout (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerout", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointerout", value: cb' value })
instance Attr anything OnPointerout  Cb  where
  attr OnPointerout value = unsafeAttribute $ This $ pure $
    { key: "pointerout", value: cb' value }
instance Attr anything OnPointerout (Event.Event  Cb ) where
  attr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerout", value: cb' value }

instance Attr anything OnPointerout (ST.ST Global.Global  Cb ) where
  attr OnPointerout iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerout", value: cb' value }

instance Attr anything OnPointerout (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerout bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerout", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerout", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerout (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPointerout (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerout", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerout", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerout  (Effect Unit)  where
  attr OnPointerout value = unsafeAttribute $ This $ pure $
    { key: "pointerout", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerout (Event.Event  (Effect Unit) ) where
  attr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerout (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPointerout iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerout (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerout bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerout", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerout", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerout (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPointerout (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerout", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerout", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerout  (Effect Boolean)  where
  attr OnPointerout value = unsafeAttribute $ This $ pure $
    { key: "pointerout", value: cb' (Cb (const value)) }
instance Attr anything OnPointerout (Event.Event  (Effect Boolean) ) where
  attr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const value)) }

instance Attr anything OnPointerout (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPointerout iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerout", value: cb' (Cb (const value)) }

instance Attr everything OnPointerout (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerout bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerout", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerout", value: unset' })
instance Attr everything OnPointerout (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPointerout (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "pointerout", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointerout", value: unset' })
instance Attr everything OnPointerout  Unit  where
  attr OnPointerout _ = unsafeAttribute $ This $ pure $
    { key: "pointerout", value: unset' }
instance Attr everything OnPointerout (Event.Event  Unit ) where
  attr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerout", value: unset' }

instance Attr everything OnPointerout (ST.ST Global.Global  Unit ) where
  attr OnPointerout iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "pointerout", value: unset' }
