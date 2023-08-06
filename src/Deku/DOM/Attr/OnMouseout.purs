module Deku.DOM.Attr.OnMouseout where

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

data OnMouseout = OnMouseout

instance Attr anything OnMouseout (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMouseout bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseout", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseout", value: cb' value })
instance Attr anything OnMouseout (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnMouseout (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mouseout", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mouseout", value: cb' value })
instance Attr anything OnMouseout  Cb  where
  attr OnMouseout value = unsafeAttribute $ This $ pure $
    { key: "mouseout", value: cb' value }
instance Attr anything OnMouseout (Event.Event  Cb ) where
  attr OnMouseout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseout", value: cb' value }

instance Attr anything OnMouseout (ST.ST Global.Global  Cb ) where
  attr OnMouseout iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mouseout", value: cb' value }

instance Attr anything OnMouseout (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMouseout bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseout", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseout", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseout (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnMouseout (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mouseout", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseout", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseout  (Effect Unit)  where
  attr OnMouseout value = unsafeAttribute $ This $ pure $
    { key: "mouseout", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseout (Event.Event  (Effect Unit) ) where
  attr OnMouseout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseout (ST.ST Global.Global  (Effect Unit) ) where
  attr OnMouseout iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mouseout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseout (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMouseout bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseout", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseout", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseout (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnMouseout (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mouseout", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseout", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseout  (Effect Boolean)  where
  attr OnMouseout value = unsafeAttribute $ This $ pure $
    { key: "mouseout", value: cb' (Cb (const value)) }
instance Attr anything OnMouseout (Event.Event  (Effect Boolean) ) where
  attr OnMouseout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseout", value: cb' (Cb (const value)) }

instance Attr anything OnMouseout (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnMouseout iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mouseout", value: cb' (Cb (const value)) }

instance Attr everything OnMouseout (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMouseout bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseout", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseout", value: unset' })
instance Attr everything OnMouseout (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnMouseout (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "mouseout", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mouseout", value: unset' })
instance Attr everything OnMouseout  Unit  where
  attr OnMouseout _ = unsafeAttribute $ This $ pure $
    { key: "mouseout", value: unset' }
instance Attr everything OnMouseout (Event.Event  Unit ) where
  attr OnMouseout eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseout", value: unset' }

instance Attr everything OnMouseout (ST.ST Global.Global  Unit ) where
  attr OnMouseout iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "mouseout", value: unset' }
