module Deku.DOM.Attr.OnMousewheel where

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

data OnMousewheel = OnMousewheel

instance Attr anything OnMousewheel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMousewheel bothValues = unsafeAttribute $ Both (pure 
    { key: "mousewheel", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mousewheel", value: cb' value })
instance Attr anything OnMousewheel (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnMousewheel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mousewheel", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mousewheel", value: cb' value })
instance Attr anything OnMousewheel  Cb  where
  attr OnMousewheel value = unsafeAttribute $ This $ pure $
    { key: "mousewheel", value: cb' value }
instance Attr anything OnMousewheel (Event.Event  Cb ) where
  attr OnMousewheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousewheel", value: cb' value }

instance Attr anything OnMousewheel (ST.ST Global.Global  Cb ) where
  attr OnMousewheel iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mousewheel", value: cb' value }

instance Attr anything OnMousewheel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMousewheel bothValues = unsafeAttribute $ Both (pure 
    { key: "mousewheel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousewheel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMousewheel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnMousewheel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mousewheel", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mousewheel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMousewheel  (Effect Unit)  where
  attr OnMousewheel value = unsafeAttribute $ This $ pure $
    { key: "mousewheel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousewheel (Event.Event  (Effect Unit) ) where
  attr OnMousewheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousewheel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousewheel (ST.ST Global.Global  (Effect Unit) ) where
  attr OnMousewheel iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mousewheel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousewheel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMousewheel bothValues = unsafeAttribute $ Both (pure 
    { key: "mousewheel", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousewheel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMousewheel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnMousewheel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mousewheel", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mousewheel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMousewheel  (Effect Boolean)  where
  attr OnMousewheel value = unsafeAttribute $ This $ pure $
    { key: "mousewheel", value: cb' (Cb (const value)) }
instance Attr anything OnMousewheel (Event.Event  (Effect Boolean) ) where
  attr OnMousewheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousewheel", value: cb' (Cb (const value)) }

instance Attr anything OnMousewheel (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnMousewheel iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mousewheel", value: cb' (Cb (const value)) }

instance Attr everything OnMousewheel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMousewheel bothValues = unsafeAttribute $ Both (pure 
    { key: "mousewheel", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mousewheel", value: unset' })
instance Attr everything OnMousewheel (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnMousewheel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "mousewheel", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mousewheel", value: unset' })
instance Attr everything OnMousewheel  Unit  where
  attr OnMousewheel _ = unsafeAttribute $ This $ pure $
    { key: "mousewheel", value: unset' }
instance Attr everything OnMousewheel (Event.Event  Unit ) where
  attr OnMousewheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mousewheel", value: unset' }

instance Attr everything OnMousewheel (ST.ST Global.Global  Unit ) where
  attr OnMousewheel iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "mousewheel", value: unset' }
