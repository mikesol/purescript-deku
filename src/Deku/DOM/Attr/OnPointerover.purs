module Deku.DOM.Attr.OnPointerover where

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

data OnPointerover = OnPointerover

instance Attr anything OnPointerover (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerover bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerover", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerover", value: cb' value })
instance Attr anything OnPointerover (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPointerover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerover", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointerover", value: cb' value })
instance Attr anything OnPointerover  Cb  where
  attr OnPointerover value = unsafeAttribute $ This $ pure $
    { key: "pointerover", value: cb' value }
instance Attr anything OnPointerover (Event.Event  Cb ) where
  attr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerover", value: cb' value }

instance Attr anything OnPointerover (ST.ST Global.Global  Cb ) where
  attr OnPointerover iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerover", value: cb' value }

instance Attr anything OnPointerover (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerover bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerover", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerover", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerover (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPointerover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerover", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerover", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerover  (Effect Unit)  where
  attr OnPointerover value = unsafeAttribute $ This $ pure $
    { key: "pointerover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerover (Event.Event  (Effect Unit) ) where
  attr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerover (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPointerover iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerover (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerover bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerover", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerover", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerover (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPointerover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerover", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerover", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerover  (Effect Boolean)  where
  attr OnPointerover value = unsafeAttribute $ This $ pure $
    { key: "pointerover", value: cb' (Cb (const value)) }
instance Attr anything OnPointerover (Event.Event  (Effect Boolean) ) where
  attr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const value)) }

instance Attr anything OnPointerover (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPointerover iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerover", value: cb' (Cb (const value)) }

instance Attr everything OnPointerover (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerover bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerover", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerover", value: unset' })
instance Attr everything OnPointerover (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPointerover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "pointerover", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointerover", value: unset' })
instance Attr everything OnPointerover  Unit  where
  attr OnPointerover _ = unsafeAttribute $ This $ pure $
    { key: "pointerover", value: unset' }
instance Attr everything OnPointerover (Event.Event  Unit ) where
  attr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerover", value: unset' }

instance Attr everything OnPointerover (ST.ST Global.Global  Unit ) where
  attr OnPointerover iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "pointerover", value: unset' }
