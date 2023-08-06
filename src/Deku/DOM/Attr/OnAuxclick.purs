module Deku.DOM.Attr.OnAuxclick where

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

data OnAuxclick = OnAuxclick

instance Attr anything OnAuxclick (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both (pure 
    { key: "auxclick", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "auxclick", value: cb' value })
instance Attr anything OnAuxclick (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnAuxclick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "auxclick", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "auxclick", value: cb' value })
instance Attr anything OnAuxclick  Cb  where
  attr OnAuxclick value = unsafeAttribute $ This $ pure $
    { key: "auxclick", value: cb' value }
instance Attr anything OnAuxclick (Event.Event  Cb ) where
  attr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "auxclick", value: cb' value }

instance Attr anything OnAuxclick (ST.ST Global.Global  Cb ) where
  attr OnAuxclick iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "auxclick", value: cb' value }

instance Attr anything OnAuxclick (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both (pure 
    { key: "auxclick", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "auxclick", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAuxclick (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnAuxclick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "auxclick", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "auxclick", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAuxclick  (Effect Unit)  where
  attr OnAuxclick value = unsafeAttribute $ This $ pure $
    { key: "auxclick", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAuxclick (Event.Event  (Effect Unit) ) where
  attr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAuxclick (ST.ST Global.Global  (Effect Unit) ) where
  attr OnAuxclick iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "auxclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAuxclick (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both (pure 
    { key: "auxclick", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "auxclick", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAuxclick (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnAuxclick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "auxclick", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "auxclick", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAuxclick  (Effect Boolean)  where
  attr OnAuxclick value = unsafeAttribute $ This $ pure $
    { key: "auxclick", value: cb' (Cb (const value)) }
instance Attr anything OnAuxclick (Event.Event  (Effect Boolean) ) where
  attr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const value)) }

instance Attr anything OnAuxclick (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnAuxclick iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "auxclick", value: cb' (Cb (const value)) }

instance Attr everything OnAuxclick (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both (pure 
    { key: "auxclick", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "auxclick", value: unset' })
instance Attr everything OnAuxclick (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnAuxclick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "auxclick", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "auxclick", value: unset' })
instance Attr everything OnAuxclick  Unit  where
  attr OnAuxclick _ = unsafeAttribute $ This $ pure $
    { key: "auxclick", value: unset' }
instance Attr everything OnAuxclick (Event.Event  Unit ) where
  attr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "auxclick", value: unset' }

instance Attr everything OnAuxclick (ST.ST Global.Global  Unit ) where
  attr OnAuxclick iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "auxclick", value: unset' }
