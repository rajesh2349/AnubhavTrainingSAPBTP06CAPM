import cds from '@sap/cds'

export class myservice extends cds.ApplicationService {
  init() {



    this.on('story', async (req, res) => {
      console.log('On story', req.data)
      let input = req.data.name;
      switch (input) {
        case "crow":
          return "crow crow crow";
          break;
        case "king":
          return "king king king";
          break;
        default:
          return "invalid input";
          break;
      }
    })

    return super.init()
  }
}
